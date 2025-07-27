// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinRedemptionProtocol.sol
/// @notice Enables revoked figures to restore their aura through verified sincerity tokens.

contract vinRedemptionProtocol {
    address public scrollKeeper;

    struct RedemptionRequest {
        string figureName;
        string actOfSincerity;
        uint256 sincerityToken;
        bool redeemed;
    }

    RedemptionRequest[] public submissions;

    event RedemptionRequested(string figureName, string actOfSincerity);
    event RedemptionGranted(string figureName, uint256 sincerityToken);

    constructor() {
        scrollKeeper = msg.sender;
    }

    modifier onlyScrollKeeper() {
        require(msg.sender == scrollKeeper, "Scroll authority required 🚫");
        _;
    }

    function submitRequest(
        string calldata figureName,
        string calldata actOfSincerity
    ) external onlyScrollKeeper {
        submissions.push(RedemptionRequest(figureName, actOfSincerity, 0, false));
        emit RedemptionRequested(figureName, actOfSincerity);
    }

    function grantRedemption(uint256 index, uint256 tokenValue) external onlyScrollKeeper {
        RedemptionRequest storage request = submissions[index];
        request.sincerityToken = tokenValue;
        request.redeemed = true;
        emit RedemptionGranted(request.figureName, tokenValue);
    }

    function getRequest(uint256 index) external view returns (RedemptionRequest memory) {
        return submissions[index];
    }
}
