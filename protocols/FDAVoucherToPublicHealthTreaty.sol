// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FDAVoucherToPublicHealthTreaty {
    address public steward;

    struct TreatyEntry {
        string voucher; // "FDA National Priority Voucher"
        string clause; // "Scrollchain-sealed treaty for regulatory acceleration, antibiotic access, and public health consequence"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyTreaty(string memory voucher, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(voucher, clause, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
