import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(
      {Key? key, required this.setFilters, required this.filters})
      : super(key: key);

  static const routeName = '/filters';

  final Function setFilters;
  final Map<String, bool> filters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    super.initState();
    _glutenFree = widget.filters['gluten']!;
    _lactoseFree = widget.filters['lactose']!;
    _vegan = widget.filters['vegan']!;
    _vegetarian = widget.filters['vegetarian']!;
  }

  Widget _buildSwitchListTile(
    bool currentValue,
    String title,
    String description,
    Function(bool)? update,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      activeColor: Theme.of(context).colorScheme.secondary,
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan,
                  };
                  widget.setFilters(selectedFilters);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  _glutenFree,
                  'Gluten free',
                  'Only include gluten free meals',
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  _lactoseFree,
                  'Lactose free',
                  'Only include lactose free meals',
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  _vegetarian,
                  'Vegetarian',
                  'Only include vegetarian meals',
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  _vegan,
                  'Vegan',
                  'Only include vegan meals',
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                )
              ],
            ))
          ],
        ));
  }
}
