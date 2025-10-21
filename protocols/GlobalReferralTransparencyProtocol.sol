// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalReferralTransparencyProtocol {
    address public admin;

    struct ReferralEntry {
        string influencerHandle;
        string productName;
        string transparencyClause;
        string emotionalTag;
        bool summoned;
        bool disclosed;
        bool sealed;
    }

    ReferralEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReferral(string memory influencerHandle, string memory productName, string memory transparencyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ReferralEntry(influencerHandle, productName, transparencyClause, emotionalTag, true, false, false));
    }

    function confirmDisclosure(uint256 index) external onlyAdmin {
        entries[index].disclosed = true;
    }

    function sealReferralEntry(uint256 index) external onlyAdmin {
        require(entries[index].disclosed, "Must be disclosed first");
        entries[index].sealed = true;
    }

    function getReferralEntry(uint256 index) external view returns (ReferralEntry memory) {
        return entries[index];
    }
}
