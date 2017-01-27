#include "str.h"

size_t str_length(const char *str) {
	size_t res=0;
	if (!str)
	{
		return 0;
	}
	while (str[res]!='\0')
	{
		res++;
	}
	return res;
}

int str_compare(const char *str1, const char *str2) {
	
	for ( ; *str1 == *str2; str1++, str2++)
	{
		if (*str1 == '\0')
		{
			return 0;
		}
	}
    return ((*(unsigned char *)str1 < *(unsigned char *)str2) ? -1 : +1);
}

const char *str_search(const char *haystack, const char *needle) {
	for (int i=0; haystack[i]!='\0'; i++)
	{
		if (haystack[i]==needle[0])
		{
			int j=0;
			while (haystack[i+j]==needle[j])
			{
				if (needle[j+1]=='\0')
				{
					return haystack+i;
				}
				j++;
			}
		}
	}
	return NULL;
}
