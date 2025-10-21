// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BidderTransparencyCodex {
    address public admin;

    struct BidderEntry {
        string firmName;
        string packageScope;
        string transparencyClause;
        string emotionalTag;
        bool summoned;
        bool disclosed;
        bool sealed;
    }

    BidderEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBidder(string memory firmName, string memory packageScope, string memory transparencyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(BidderEntry(firmName, packageScope, transparencyClause, emotionalTag, true, false, false));
    }

    function confirmDisclosure(uint256 index) external onlyAdmin {
        entries[index].disclosed = true;
    }

    function sealBidderEntry(uint256 index) external onlyAdmin {
        require(entries[index].disclosed, "Must be disclosed first");
        entries[index].sealed = true;
    }

    function getBidderEntry(uint256 index) external view returns (BidderEntry memory) {
        return entries[index];
    }
}
