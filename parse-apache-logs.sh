#!/bin/bash

"Enter client IP:"
read ip

nbr_requests=`grep $ip /var/log/apache2/access.log | wc -l`
nbr_of_get_req=`grep $ip /var/log/apache2/access.log | grep GET | wc -l`
nbr_of_post_req=`grep $ip /var/log/apache2/access.log | grep POST | wc -l`
nbr_of_200=`grep $ip /var/log/apache2/access.log | grep 200| wc -l`
nbr_of_not_200=`grep $ip /var/log/apache2/access.log | grep -v 200| wc -l`


echo "Statistics for the client $ip:"
echo -e "------------------------"
echo "Number of POST request: $nbr_of_post_req"
echo "Number of GET request: $nbr_of_get_req"
echo "Number of request with status 200: $nbr_of_200"
echo "Number of request other than 200: $nbr_of_not_200"
echo "Total number of request: $nbr_requests "