// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VietnamBenchmarkLedger {
    address public steward;

    struct BenchmarkEntry {
        string domain;
        string VietnamMetric;
        string PHGap;
        string emotionalTag;
    }

    BenchmarkEntry[] public ledger;

    event VietnamBenchmarkTagged(string domain, string VietnamMetric, string PHGap, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagBenchmark(
        string memory domain,
        string memory VietnamMetric,
        string memory PHGap,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(BenchmarkEntry(domain, VietnamMetric, PHGap, emotionalTag));
        emit VietnamBenchmarkTagged(domain, VietnamMetric, PHGap, emotionalTag);
    }
}
