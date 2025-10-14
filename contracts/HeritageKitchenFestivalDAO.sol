// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageKitchenFestivalDAO {
    address public admin;

    struct Festival {
        string kitchenName;
        string region;
        string featuredDish;
        uint256 date;
        bool celebrated;
    }

    Festival[] public festivals;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function scheduleFestival(string memory _kitchenName, string memory _region, string memory _featuredDish, uint256 _date) external onlyAdmin {
        festivals.push(Festival(_kitchenName, _region, _featuredDish, _date, false));
    }

    function markCelebrated(uint256 index) external onlyAdmin {
        festivals[index].celebrated = true;
    }

    function getFestival(uint256 index) external view returns (Festival memory) {
        return festivals[index];
    }
}
