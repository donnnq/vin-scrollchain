// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NourishmentEquityDAO {
    address public steward;

    struct EquityEntry {
        string beneficiaryGroup;
        string nourishmentBarrier;
        string equityProtocol;
        string emotionalTag;
    }

    EquityEntry[] public registry;

    event NourishmentEquityTagged(string beneficiaryGroup, string nourishmentBarrier, string equityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEquity(
        string memory beneficiaryGroup,
        string memory nourishmentBarrier,
        string memory equityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EquityEntry(beneficiaryGroup, nourishmentBarrier, equityProtocol, emotionalTag));
        emit NourishmentEquityTagged(beneficiaryGroup, nourishmentBarrier, equityProtocol, emotionalTag);
    }
}
