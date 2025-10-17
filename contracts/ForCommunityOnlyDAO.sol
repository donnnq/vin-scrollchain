// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForCommunityOnlyDAO {
    address public admin;

    struct CommunityEntry {
        string projectName;
        string purokName;
        string emotionalTag;
        bool declaredPublic;
        bool protectedFromBranding;
    }

    CommunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function declarePublic(string memory projectName, string memory purokName, string memory emotionalTag) external onlyAdmin {
        entries.push(CommunityEntry(projectName, purokName, emotionalTag, true, true));
    }

    function getCommunityEntry(uint256 index) external view returns (CommunityEntry memory) {
        return entries[index];
    }
}
