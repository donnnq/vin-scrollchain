// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mobile4PsOutreachDAO {
    address public admin;

    struct OutreachEntry {
        string barangayName;
        string purokID;
        string outreachType;
        string emotionalTag;
        bool summoned;
        bool conducted;
        bool sealed;
    }

    OutreachEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOutreach(string memory barangayName, string memory purokID, string memory outreachType, string memory emotionalTag) external onlyAdmin {
        entries.push(OutreachEntry(barangayName, purokID, outreachType, emotionalTag, true, false, false));
    }

    function conductOutreach(uint256 index) external onlyAdmin {
        entries[index].conducted = true;
    }

    function sealOutreach(uint256 index) external onlyAdmin {
        require(entries[index].conducted, "Must be conducted first");
        entries[index].sealed = true;
    }

    function getOutreachEntry(uint256 index) external view returns (OutreachEntry memory) {
        return entries[index];
    }
}
