// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaKitchenSovereigntyFestivalDAO {
    address public admin;

    struct Festival {
        string community;
        string dish;
        string ritual;
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

    function scheduleFestival(string memory _community, string memory _dish, string memory _ritual, uint256 _date) external onlyAdmin {
        festivals.push(Festival(_community, _dish, _ritual, _date, false));
    }

    function markCelebrated(uint256 index) external onlyAdmin {
        festivals[index].celebrated = true;
    }

    function getFestival(uint256 index) external view returns (Festival memory) {
        return festivals[index];
    }
}
