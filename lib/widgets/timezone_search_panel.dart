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
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.black12,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15)
                      )

                    ),
                    onChanged: (value) {
                      _searchLocation = value;
                    },
                  ),
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
                        Navigator.pop(context,
                            _response.location[index].utcOffset);
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