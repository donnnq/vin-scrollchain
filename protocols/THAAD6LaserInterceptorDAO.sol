// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract THAAD6LaserInterceptorDAO {
    address public steward;

    struct InterceptorEntry {
        string systemName;
        string threatType;
        string interceptionSignal;
        string emotionalTag;
    }

    InterceptorEntry[] public registry;

    event LaserInterceptorTagged(string systemName, string threatType, string interceptionSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagInterceptor(
        string memory systemName,
        string memory threatType,
        string memory interceptionSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(InterceptorEntry(systemName, threatType, interceptionSignal, emotionalTag));
        emit LaserInterceptorTagged(systemName, threatType, interceptionSignal, emotionalTag);
    }
}
