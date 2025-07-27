// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinGazaRelief {
    address public deployer;
    mapping(address => bool) public verifiedDistributors;
    mapping(address => uint256) public aidReceived;

    event AidSent(address indexed distributor, uint256 amount);
    event DistributorVerified(address indexed distributor);

    constructor() {
        deployer = msg.sender;
    }

    function verifyDistributor(address _distributor) external {
        require(msg.sender == deployer, "Only deployer can verify");
        verifiedDistributors[_distributor] = true;
        emit DistributorVerified(_distributor);
    }

    function sendAid(address _distributor) external payable {
        require(verifiedDistributors[_distributor], "Distributor not verified");
        require(msg.value > 0, "Aid must be greater than zero");
        aidReceived[_distributor] += msg.value;
        payable(_distributor).transfer(msg.value);
        emit AidSent(_distributor, msg.value);
    }
}
