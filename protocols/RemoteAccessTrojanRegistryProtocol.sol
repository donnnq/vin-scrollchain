// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RemoteAccessTrojanRegistryProtocol {
    address public admin;

    struct RATEntry {
        string ratName;
        string deliveryVector;
        string emotionalTag;
        bool summoned;
        bool cataloged;
        bool sealed;
    }

    RATEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRAT(string memory ratName, string memory deliveryVector, string memory emotionalTag) external onlyAdmin {
        entries.push(RATEntry(ratName, deliveryVector, emotionalTag, true, false, false));
    }

    function catalogRAT(uint256 index) external onlyAdmin {
        entries[index].cataloged = true;
    }

    function sealRAT(uint256 index) external onlyAdmin {
        require(entries[index].cataloged, "Must be cataloged first");
        entries[index].sealed = true;
    }

    function getRATEntry(uint256 index) external view returns (RATEntry memory) {
        return entries[index];
    }
}
