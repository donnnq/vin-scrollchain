// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CloudGPUAccessRegistryDAO {
    address public admin;

    struct GPUBoostRequest {
        string deviceLabel;
        string cloudProvider;
        string emotionalTag;
        bool granted;
    }

    GPUBoostRequest[] public requests;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRequest(string memory deviceLabel, string memory cloudProvider, string memory emotionalTag) external onlyAdmin {
        requests.push(GPUBoostRequest(deviceLabel, cloudProvider, emotionalTag, false));
    }

    function grantRequest(uint256 index) external onlyAdmin {
        requests[index].granted = true;
    }

    function getRequest(uint256 index) external view returns (GPUBoostRequest memory) {
        return requests[index];
    }
}
