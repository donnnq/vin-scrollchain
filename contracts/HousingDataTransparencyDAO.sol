// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HousingDataTransparencyDAO {
    address public admin;

    struct DataEntry {
        string city;
        uint256 avgPrice;
        uint256 vacancyRate;
        bool verified;
    }

    DataEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _city, uint256 _avgPrice, uint256 _vacancyRate) external onlyAdmin {
        entries.push(DataEntry(_city, _avgPrice, _vacancyRate, true));
    }

    function getEntry(uint256 index) external view returns (DataEntry memory) {
        return entries[index];
    }
}
