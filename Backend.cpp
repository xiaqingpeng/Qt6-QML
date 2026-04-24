#include "Backend.h"

Backend::Backend(QObject *parent) : QObject(parent), m_counter(0) {
}

int Backend::counter() const
{
    return m_counter;
}

void Backend::increment()
{
    m_counter++;
    emit counterChanged();
}

