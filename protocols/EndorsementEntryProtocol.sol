// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EndorsementEntryProtocol {
    address public admin;

    struct EndorsementEntry {
        string productName;
        string creator;
        string origin;
        string emotionalTag;
        bool summoned;
        bool endorsed;
        bool submittedToMarket;
    }

    EndorsementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEndorsement(string memory productName, string memory creator, string memory origin, string memory emotionalTag) external onlyAdmin {
        entries.push(EndorsementEntry(productName, creator, origin, emotionalTag, true, false, false));
    }

    function endorseProduct(uint256 index) external onlyAdmin {
        entries[index].endorsed = true;
    }

    function submitToMarket(uint256 index) external onlyAdmin {
        require(entries[index].endorsed, "Must be endorsed first");
        entries[index].submittedToMarket = true;
    }

    function getEndorsementEntry(uint256 index) external view returns (EndorsementEntry memory) {
        return entries[index];
    }
}
