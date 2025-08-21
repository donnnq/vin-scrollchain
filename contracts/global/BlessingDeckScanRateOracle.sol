// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckScanRateOracle {
    struct ScanRate {
        string region;
        uint256 scansToday;
        uint256 scansThisWeek;
        uint256 lastScanTimestamp;
    }

    mapping(string => ScanRate) public scanRates;

    event ScanLogged(string region, uint256 scansToday, uint256 scansThisWeek);

    function logScan(string memory _region) public {
        ScanRate storage rate = scanRates[_region];
        rate.scansToday += 1;
        rate.scansThisWeek += 1;
        rate.lastScanTimestamp = block.timestamp;

        emit ScanLogged(_region, rate.scansToday, rate.scansThisWeek);
    }

    function getScanRate(string memory _region) public view returns (ScanRate memory) {
        return scanRates[_region];
    }
}
