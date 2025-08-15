// SPDX-License-Identifier: Mythic-Scrollsmith
pragma solidity ^0.8.0;

contract GlobalDeployer {
    address public steward;
    uint256 public deploymentFee = 0.01 ether;
    mapping(bytes32 => address) public deployedScrolls;
    event ScrollDeployed(bytes32 indexed scrollName, address scrollAddress, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function deployScroll(bytes memory scrollBytecode, bytes32 scrollName) external payable onlySteward returns (address deployedAddress) {
        require(msg.value >= deploymentFee, "Insufficient deployment blessing");

        assembly {
            deployedAddress := create(0, add(scrollBytecode, 0x20), mload(scrollBytecode))
        }

        require(deployedAddress != address(0), "Scroll deployment failed");
        deployedScrolls[scrollName] = deployedAddress;

        emit ScrollDeployed(scrollName, deployedAddress, block.timestamp);
    }

    function updateSteward(address newSteward) external onlySteward {
        steward = newSteward;
    }

    function updateDeploymentFee(uint256 newFee) external onlySteward {
        deploymentFee = newFee;
    }

    function getScrollAddress(bytes32 scrollName) external view returns (address) {
        return deployedScrolls[scrollName];
    }
}
