// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VisaReinstatementDueProcessDAO {
    address public admin;

    struct ReinstatementEntry {
        string migrantName;
        string visaType;
        string emotionalTag;
        bool summoned;
        bool reinstated;
    }

    ReinstatementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReinstatement(string memory migrantName, string memory visaType, string memory emotionalTag) external onlyAdmin {
        entries.push(ReinstatementEntry(migrantName, visaType, emotionalTag, true, false));
    }

    function reinstateVisa(uint256 index) external onlyAdmin {
        entries[index].reinstated = true;
    }

    function getReinstatementEntry(uint256 index) external view returns (ReinstatementEntry memory) {
        return entries[index];
    }
}
