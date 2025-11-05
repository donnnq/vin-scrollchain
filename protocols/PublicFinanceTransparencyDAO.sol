// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicFinanceTransparencyDAO {
    address public steward;

    struct TransparencyEntry {
        string fundName;
        string allocationProtocol;
        string auditSignal;
        string emotionalTag;
    }

    TransparencyEntry[] public registry;

    event FinanceTransparencyTagged(string fundName, string allocationProtocol, string auditSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTransparency(
        string memory fundName,
        string memory allocationProtocol,
        string memory auditSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TransparencyEntry(fundName, allocationProtocol, auditSignal, emotionalTag));
        emit FinanceTransparencyTagged(fundName, allocationProtocol, auditSignal, emotionalTag);
    }
}
