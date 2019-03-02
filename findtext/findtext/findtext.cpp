
#include "pch.h"
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main(int argc, char * argv[])
{
	if (argc != 3)
	{
		cout << "Input data is inccorect" << endl;
		return 1;
	}

	ifstream fin(argv[1]);
	if (!fin.is_open())
	{
		cout << "Input file did not open" << endl;
		return 1;
	}

	string text = argv[2];
	if (text.empty())
	{
		cout << "Text must not be empty" << endl;
		return 1;
	}

	bool found = false;
	string str;
	int strNum = 1;

	while (getline(fin, str))
	{
		if (str.find(text) != string::npos)
		{
			cout << "\"" << text << "\" was found on the " << strNum << " line" << endl;
			found = true;
		}
		strNum++;
	}

	if (found == false)
	{
		cout << "Text not found" << endl;
		return 1;
	}

	fin.close();

	return 0;
}
