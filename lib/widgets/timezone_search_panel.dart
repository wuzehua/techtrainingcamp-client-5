import 'package:clock_challenge/model/location_response_entity.dart';
import 'package:clock_challenge/network/http_service.dart';
import 'package:clock_challenge/widgets/location_list_item.dart';
import 'package:flutter/material.dart';

class TimezoneSearchPanel extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TimezoneSearchState();
  }

}


class _TimezoneSearchState extends State<TimezoneSearchPanel> {

  LocationResponse _response;
  String _searchLocation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    _searchLocation = value;
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  LocationResponse res = await HttpService.getService().getLocations(_searchLocation);
                  setState(() {
                    _response = res;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _itemCount(),
                itemBuilder: (context, index) {
                  if (_response != null && _response.location != null) {
                    return LocationListItem(_response.location[index],
                      onPressed: (){

                      },
                    );
                  }
                  return null;
                }),
          )
          ,
        ],
      ),
    );
  }

  int _itemCount() {
    if (_response == null || _response.location == null) {
      return 0;
    }

    return _response.location.length;
  }

}