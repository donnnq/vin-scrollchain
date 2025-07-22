// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vinCrisisReliefVault
/// @notice Humanitarian fund contract to support food, medicine, or service aid in conflict zones
contract vinCrisisReliefVault {
    address public scrollkeeper;
    mapping(address => bool) public verifiedDistributors;
    mapping(address => uint256) public releasedAid;

    event AidApproved(address indexed distributor, uint256 amount);
    event DistributorVerified(address indexed distributor);
    event FundsWithdrawn(address indexed distributor, uint256 amount);

    modifier onlyKeeper() {
        require(msg.sender == scrollkeeper, "Scroll reject: Not keeper");
        _;
    }

    modifier onlyVerified() {
        require(verifiedDistributors[msg.sender], "Not verified for relief ops");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function verifyDistributor(address distributor) external onlyKeeper {
        verifiedDistributors[distributor] = true;
        emit DistributorVerified(distributor);
    }

    function approveAid(address distributor, uint256 amount) external onlyKeeper {
        require(verifiedDistributors[distributor], "Distributor not verified");
        require(address(this).balance >= amount, "Insufficient scroll funds");
        releasedAid[distributor] += amount;
        emit AidApproved(distributor, amount);
    }

    function withdrawAid(uint256 amount) external onlyVerified {
        require(releasedAid[msg.sender] >= amount, "Amount exceeds allocation");
        releasedAid[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit FundsWithdrawn(msg.sender, amount);
    }

    receive() external payable {}
}
