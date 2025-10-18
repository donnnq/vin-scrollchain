// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EndorsementPlanningLedger {
    address public admin;

    struct EndorsementEntry {
        string productName;
        string creator;
        string origin;
        string emotionalTag;
        bool summoned;
        bool proposed;
        bool endorsed;
    }

    EndorsementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function proposeEndorsement(string memory productName, string memory creator, string memory origin, string memory emotionalTag) external onlyAdmin {
        entries.push(EndorsementEntry(productName, creator, origin, emotionalTag, true, true, false));
    }

    function endorseProduct(uint256 index) external onlyAdmin {
        require(entries[index].proposed, "Must be proposed first");
        entries[index].endorsed = true;
    }

    function getEndorsementEntry(uint256 index) external view returns (EndorsementEntry memory) {
        return entries[index];
    }
}
