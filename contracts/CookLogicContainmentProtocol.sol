// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CookLogicContainmentProtocol {
    address public admin;

    struct CookEntry {
        string protocolName;
        string flawType;
        string emotionalTag;
        bool flagged;
        bool patched;
    }

    CookEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagFlaw(string memory protocolName, string memory flawType, string memory emotionalTag) external onlyAdmin {
        entries.push(CookEntry(protocolName, flawType, emotionalTag, true, false));
    }

    function patchFlaw(uint256 index) external onlyAdmin {
        entries[index].patched = true;
    }

    function getCookEntry(uint256 index) external view returns (CookEntry memory) {
        return entries[index];
    }
}
