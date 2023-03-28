#ifndef _PERSONDATA_H
#define _PERSONDATA_H

/* The data about a person in the database */
class PersonData
{
public:
    PersonData();

    void setHeight(float height);
    void setWeight(float weight);

    float height();
    float weight();
    float bmi();

private:
    /* The person's height */
    float _height;

    /* The person's weight */
    float _weight;
};

#endif