// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EssentialGoodsKarmaLedger {
    address public steward;

    struct KarmaEntry {
        string goodName;
        string supplierName;
        string karmaSignal;
        string emotionalTag;
    }

    KarmaEntry[] public ledger;

    event EssentialGoodsKarmaTagged(string goodName, string supplierName, string karmaSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagKarma(
        string memory goodName,
        string memory supplierName,
        string memory karmaSignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(KarmaEntry(goodName, supplierName, karmaSignal, emotionalTag));
        emit EssentialGoodsKarmaTagged(goodName, supplierName, karmaSignal, emotionalTag);
    }
}
