// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FOICommonsDashboardTreaty {
    address public originator;

    struct DashboardScroll {
        string citizenTag;
        string dashboardSignal;
        string accessAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    DashboardScroll[] public dashboardLedger;

    constructor() {
        originator = msg.sender;
    }

    function logDashboardScroll(
        string memory citizenTag,
        string memory dashboardSignal,
        string memory accessAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        dashboardLedger.push(DashboardScroll({
            citizenTag: citizenTag,
            dashboardSignal: dashboardSignal,
            accessAction: accessAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
