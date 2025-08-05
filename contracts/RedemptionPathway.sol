// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinRedemptionPathway {
    mapping(address => RedemptionRequest) public requests;

    struct RedemptionRequest {
        address petitioner;
        string message;
        uint256 timestamp;
        bool exists;
    }

    event RedemptionSubmitted(address petitioner, string message);

    function submitRedemption(string calldata message) external {
        require(!requests[msg.sender].exists, "Already submitted");

        requests[msg.sender] = RedemptionRequest({
            petitioner: msg.sender,
            message: message,
            timestamp: block.timestamp,
            exists: true
        });

        emit RedemptionSubmitted(msg.sender, message);
    }

    function hasRequested(address petitioner) external view returns (bool) {
        return requests[petitioner].exists;
    }

    function getMessage(address petitioner) external view returns (string memory) {
        return requests[petitioner].message;
    }
}
