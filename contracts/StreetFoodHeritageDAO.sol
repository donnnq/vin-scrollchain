// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StreetFoodHeritageDAO {
    address public admin;

    struct HeritageEntry {
        string vendorName;
        string dishName;
        string originStory;
        string emotionalTag;
        bool registered;
        bool celebrated;
    }

    HeritageEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerVendor(string memory vendorName, string memory dishName, string memory originStory, string memory emotionalTag) external onlyAdmin {
        entries.push(HeritageEntry(vendorName, dishName, originStory, emotionalTag, true, false));
    }

    function celebrateVendor(uint256 index) external onlyAdmin {
        entries[index].celebrated = true;
    }

    function getVendor(uint256 index) external view returns (HeritageEntry memory) {
        return entries[index];
    }
}
