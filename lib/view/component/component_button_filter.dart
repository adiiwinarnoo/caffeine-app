import 'package:flutter/material.dart';
import 'package:flutter_caffeine/controller/provider/filter_button_provider.dart';
import 'package:provider/provider.dart';

class ComponentFilterButton extends StatelessWidget {
  const ComponentFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSelectedAll = Provider.of<FilterButtonProvider>(context).typeOrder;
    bool isSelectedPickup = Provider.of<FilterButtonProvider>(context).typeOrderPickup;
    bool isSelectedDelivery = Provider.of<FilterButtonProvider>(context).typeOrderDelivery;
    bool isSelectedDinein = Provider.of<FilterButtonProvider>(context).typeOrderDinein;

    void filterAll(){
      if (isSelectedAll){
        Provider.of<FilterButtonProvider>(context,listen: false).setAllFilter(true);
      }else{
        Provider.of<FilterButtonProvider>(context,listen: false).setTypeFilter('');
        Provider.of<FilterButtonProvider>(context,listen: false).setAllFilter(true);
        Provider.of<FilterButtonProvider>(context,listen: false).setPickupFilter(false);
        Provider.of<FilterButtonProvider>(context,listen: false).setDeliveryFilter(false);
        Provider.of<FilterButtonProvider>(context,listen: false).setDineinFilter(false);
      }
    }

    void filterPickup(){
      if (isSelectedPickup){
        Provider.of<FilterButtonProvider>(context,listen: false).setPickupFilter(false);
      }else{
        Provider.of<FilterButtonProvider>(context,listen: false).setTypeFilter('pickup');
        Provider.of<FilterButtonProvider>(context,listen: false).setPickupFilter(true);
        Provider.of<FilterButtonProvider>(context,listen: false).setAllFilter(false);
        Provider.of<FilterButtonProvider>(context,listen: false).setDeliveryFilter(false);
        Provider.of<FilterButtonProvider>(context,listen: false).setDineinFilter(false);
      }
    }
    void filterDelivery(){
      if (isSelectedDelivery){
        Provider.of<FilterButtonProvider>(context,listen: false).setDeliveryFilter(false);
      }else{
        Provider.of<FilterButtonProvider>(context,listen: false).setTypeFilter('delivery');
        Provider.of<FilterButtonProvider>(context,listen: false).setDeliveryFilter(true);
        Provider.of<FilterButtonProvider>(context,listen: false).setPickupFilter(false);
        Provider.of<FilterButtonProvider>(context,listen: false).setAllFilter(false);
        Provider.of<FilterButtonProvider>(context,listen: false).setDineinFilter(false);
      }
    }
    void filterDinein(){
      if (isSelectedDinein){
        Provider.of<FilterButtonProvider>(context,listen: false).setDineinFilter(false);
      }else{
        Provider.of<FilterButtonProvider>(context,listen: false).setTypeFilter('dinein');
        Provider.of<FilterButtonProvider>(context,listen: false).setAllFilter(false);
        Provider.of<FilterButtonProvider>(context,listen: false).setPickupFilter(false);
        Provider.of<FilterButtonProvider>(context,listen: false).setDeliveryFilter(false);
        Provider.of<FilterButtonProvider>(context,listen: false).setDineinFilter(true);
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TextButton(
              onPressed: (){
                filterAll();
              },
              child: Container(
                width: 65,
                decoration: BoxDecoration(
                    color: isSelectedAll ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(child: Text('전체',style: TextStyle(color: isSelectedAll ? Colors.white : Colors.black),)),
                ),
              )
          ),
          TextButton(
              onPressed: (){
                filterPickup();
              },
              child: Container(
                width: 65,
                decoration: BoxDecoration(
                    color: isSelectedPickup ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(child: Text('픽업',style: TextStyle(color: isSelectedPickup ? Colors.white : Colors.black,),)),
                ),
              )
          ),
          TextButton(
              onPressed: (){
                filterDelivery();
              },
              child: Container(
                width: 65,
                decoration: BoxDecoration(
                    color: isSelectedDelivery ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(child: Text('배달',style: TextStyle(color: isSelectedDelivery ? Colors.white : Colors.black,),)),
                ),
              )
          ),
          TextButton(
              onPressed: (){
                filterDinein();
              },
              child: Container(
                width: 65,
                decoration: BoxDecoration(
                    color: isSelectedDinein ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(child: Text('홀',style: TextStyle(color: isSelectedDinein ? Colors.white : Colors.black),)),
                ),
              )
          ),
        ],
      ),
    );
  }
}
