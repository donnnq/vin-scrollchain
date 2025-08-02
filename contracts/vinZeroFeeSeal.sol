// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinZeroFeeSeal {
    address public agencyOwner;
    mapping(address => bool) public verifiedApplicants;

    constructor() {
        agencyOwner = msg.sender;
    }

    function verifyApplicant(address applicant) public {
        require(msg.sender == agencyOwner, "Only agency can verify");
        verifiedApplicants[applicant] = true;
    }

    function isZeroFeeApproved(address applicant) public view returns (bool) {
        return verifiedApplicants[applicant];
    }
}
