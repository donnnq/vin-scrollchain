// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "./vinJobRegistry.sol";
import "./vinZeroFeeSeal.sol";

contract vinDirectApplyNode {
    vinJobRegistry public jobContract;
    vinZeroFeeSeal public sealContract;

    struct Application {
        address applicant;
        uint256 jobIndex;
        bool submitted;
    }

    Application[] public applications;

    constructor(address jobAddr, address sealAddr) {
        jobContract = vinJobRegistry(jobAddr);
        sealContract = vinZeroFeeSeal(sealAddr);
    }

    function apply(uint256 jobIndex) public {
        require(sealContract.isZeroFeeApproved(msg.sender), "Applicant not verified");
        applications.push(Application(msg.sender, jobIndex, true));
    }

    function totalApplications() public view returns (uint) {
        return applications.length;
    }
}
