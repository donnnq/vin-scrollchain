// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodparkSovereigntyDAO {
    address public steward;

    struct FoodparkEntry {
        string city;
        string cuisineType;
        string vendorCollective;
        string emotionalTag;
    }

    FoodparkEntry[] public registry;

    event FoodparkTagged(string city, string cuisineType, string vendorCollective, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagFoodpark(
        string memory city,
        string memory cuisineType,
        string memory vendorCollective,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(FoodparkEntry(city, cuisineType, vendorCollective, emotionalTag));
        emit FoodparkTagged(city, cuisineType, vendorCollective, emotionalTag);
    }
}
