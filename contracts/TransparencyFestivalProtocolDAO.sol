// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransparencyFestivalProtocolDAO {
    address public admin;

    struct Festival {
        string theme;
        string hostAgency;
        uint256 date;
        bool held;
    }

    Festival[] public festivals;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function scheduleFestival(string memory _theme, string memory _hostAgency, uint256 _date) external onlyAdmin {
        festivals.push(Festival(_theme, _hostAgency, _date, false));
    }

    function markHeld(uint256 index) external onlyAdmin {
        festivals[index].held = true;
    }

    function getFestival(uint256 index) external view returns (Festival memory) {
        return festivals[index];
    }
}
