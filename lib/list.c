#include "list.h"

struct list_node {
  int value;
  struct list_node *next;
  // struct list_node *prev;
};

void list_create(struct list *self) {
	self->first=NULL;
}

void list_destroy(struct list *self) {
	struct list_node *curr=self->first;
	while(curr)
	{
		struct list_node *next=curr->next;
		free(curr);
		curr=next;
	}
}

bool list_equals(const struct list *self, const int *data, size_t size) {
	if (list_size(self)==size)
	{
		struct list_node *curr=self->first;
		size_t i=0;
		while (curr)
		{
			if(curr->value!=data[i])
			{
				return false;
			}
			curr=curr->next;
			i++;
		}
		return true;
	}
	return false;
}

void list_add_back(struct list *self, int value) {
	struct list_node *node=malloc(sizeof(struct list_node));
	node->next=NULL;
	node->value=value;
	if (list_is_empty(self))
	{
		struct list_node *next=self->first;
		self->first=node;
		return;
	}
	struct list_node *curr=self->first;
	while (curr->next)
	{
		curr=curr->next;
	}
	curr->next=node;
	
}

void list_add_front(struct list *self, int value) {
	struct list_node *node=malloc(sizeof(struct list_node));
	node->value=value;
	node->next=self->first;
	self->first=node;
}

void list_insert(struct list *self, int value, size_t index) {
	//fin
	if (index>=list_size(self))
	{
		list_add_back(self,value);
	}	
	else
	{
		struct list_node *node=malloc(sizeof(struct list_node));
		node->value=value;
		//début
		if (index==0)
		{
			node->next=self->first;
			self->first=node;
		}
		//milieu
		else
		{
			struct list_node *curr=self->first;
			size_t i=1;
			while (i<index)
			{
				curr=curr->next;
				i++;
			}
			struct list_node *tmp=curr->next;
			curr->next=node;
			node->next=tmp;
		}
	}
}

void list_remove(struct list *self, size_t index) {
	if (index>=list_size(self))
	{
		struct list_node *curr=self->first;
		while (curr->next->next)
		{
			curr=curr->next;
		}
		free(curr->next);
		curr->next=NULL;
	}	
	else
	{
		if (index==0)
		{
			struct list_node *tmp=self->first->next;
			free(self->first);
			self->first=tmp;
		}
		else
		{
			struct list_node *curr=self->first;
			size_t i=1;
			while (i<index)
			{
				curr=curr->next;
				i++;
			}
			struct list_node *tmp=curr->next->next;
			free(curr->next);
			curr->next=tmp;
		}
	}
}

int *list_get(const struct list *self, size_t index) {
	if (list_size(self)<index ||  list_is_empty(self))
	{
		return NULL;
	}
	if (list_size(self)==1)
	{
		return &self->first->value;
	}
	struct list_node *curr=self->first;
	size_t i=0;
	while (i<index)
	{
		curr=curr->next;
		i++;
	}
	return &curr->value;
}

bool list_is_empty(const struct list *self) {
	return (!self->first);
}

size_t list_size(const struct list *self) {
	if (list_is_empty(self))
	{
		return 0;
	}
	size_t size=1;
	struct list_node *curr=self->first;
	while (curr=curr->next)
	{
		size++;
	}
	return size;
}

size_t list_search(const struct list *self, int value) {
	if (list_is_empty(self))
	{
		return list_size(self);
	}
	size_t index=0;
	struct list_node *curr=self->first;
	while (curr->value!=value && curr->next)
	{
		curr=curr->next;
		index++;
	}
	if (curr->value!=value) return list_size(self);
	return index;
}

void list_import(struct list *self, const int *other, size_t size) {
	struct list_node *curr=self->first;
	while (list_size(self)>0)
	{
		list_remove(self, 0);
	}
	for (size_t i=0; i< size;i++)
	{
		list_add_back(self, other[i]);
	}
}

void list_dump(const struct list *self) {
	struct list_node *curr=self->first;
	while (curr)
	{
		fprintf(stdout,"%d\n", curr->value);
		curr=curr->next;
	}
}

bool list_is_sorted(const struct list *self) {
	if (list_size(self)>=2)
	{
		struct list_node *curr=self->first;
		while (curr->next)
		{
			if (curr->next->value<curr->value)
			{
				return false;
			}
			curr=curr->next;
		}
	}
	return true;
}


void list_merge_sort(struct list *self) {
	self->first=mergeSort(self->first); 
}

struct list_node *mergeSort(struct list_node *head) {   
    struct list_node *list1 = head; 
    if ( (list1 == NULL) || (list1->next == NULL) )
    {   
        return list1;
    }   

    struct list_node *list2 = bisectList(list1);
    
    return mergeList( mergeSort(list1), mergeSort(list2) );
}


static struct list_node* mergeList(struct list_node *list1, struct list_node *list2)
{
    struct list_node dummy_head = { 0, NULL }, *tail = &dummy_head;

    while ( (list1 != NULL) && (list2 != NULL) )
    {   
        struct list_node **min = (list1->value < list2->value) ? &list1 : &list2;
        struct list_node *next = (*min)->next;
        tail = tail->next = *min;
        *min = next;
    }
    tail->next = list1 ? list1 : list2;
    return dummy_head.next;
}

static struct list_node *bisectList(struct list_node *head)
{
    struct list_node *fast = head, *slow = head, *prev = NULL;

    while (fast != NULL && fast->next != NULL)
    {
        fast = fast->next->next;
        prev = slow;
        slow = slow->next;
    }

    if (prev != NULL)
    {
        prev->next = NULL;
    }
    return slow;
}