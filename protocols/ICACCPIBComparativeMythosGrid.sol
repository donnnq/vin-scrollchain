// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICACCPIBComparativeMythosGrid {
    address public admin;

    struct MythosEntry {
        string agencyModel; // "ICAC", "CPIB"
        string mythosSignal; // "Zero tolerance", "Public education", "Swift prosecution"
        string comparativeStrength; // "Independence", "Conviction rate", "Public trust"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    MythosEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function indexMythos(string memory agencyModel, string memory mythosSignal, string memory comparativeStrength, string memory emotionalTag) external onlyAdmin {
        entries.push(MythosEntry(agencyModel, mythosSignal, comparativeStrength, emotionalTag, true, false));
    }

    function sealMythosEntry(uint256 index) external onlyAdmin {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getMythosEntry(uint256 index) external view returns (MythosEntry memory) {
        return entries[index];
    }
}
