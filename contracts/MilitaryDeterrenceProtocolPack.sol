// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MilitaryDeterrenceProtocolPack {
    address public admin;

    struct DeterrenceEntry {
        string regionLabel;
        string deterrenceAction;
        string emotionalTag;
        bool deployed;
        bool escalated;
    }

    DeterrenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitDeterrence(string memory regionLabel, string memory deterrenceAction, string memory emotionalTag) external onlyAdmin {
        entries.push(DeterrenceEntry(regionLabel, deterrenceAction, emotionalTag, false, false));
    }

    function deployDeterrence(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function escalateDeterrence(uint256 index) external onlyAdmin {
        entries[index].escalated = true;
    }

    function getDeterrence(uint256 index) external view returns (DeterrenceEntry memory) {
        return entries[index];
    }
}
