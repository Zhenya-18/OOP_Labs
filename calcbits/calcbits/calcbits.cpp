
#include "pch.h"
#include <iostream>
#include <string>
#include <bitset>

using namespace std;

int main(int argc, char * argv[])
{
	if (argc != 2)
	{
		cout << "Input data is incorrect" << endl;
		return 1;
	}
	string str = argv[1];

	for (const auto &c : str)
	{
		if (! isdigit((unsigned char)c))
		{
			cout << "It must be a number" << endl;
			return 1;
		}
	}

	int byte = atoi(str.c_str());
	if ((byte < 0) || (byte > 255))
	{
		cout << "Number must be between 0 and 255" << endl;
		return 1;
	}

	bitset<8> b2(byte);
	cout << b2.count() << endl;

	return 0;
}