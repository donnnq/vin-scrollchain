// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TradeDeficitImmunityIndex {
    address public steward;

    struct DeficitEntry {
        string countryPartner;
        string deficitAmount;
        string immunityProtocol;
        string emotionalTag;
    }

    DeficitEntry[] public index;

    event TradeDeficitImmunized(string countryPartner, string deficitAmount, string immunityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function immunizeDeficit(
        string memory countryPartner,
        string memory deficitAmount,
        string memory immunityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        index.push(DeficitEntry(countryPartner, deficitAmount, immunityProtocol, emotionalTag));
        emit TradeDeficitImmunized(countryPartner, deficitAmount, immunityProtocol, emotionalTag);
    }
}
