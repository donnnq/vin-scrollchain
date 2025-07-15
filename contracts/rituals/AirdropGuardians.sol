// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/// @dev Off-chain KYC oracle interface.
///      The oracle calls `registerUser` after verifying pic+ID.
interface IKYCRegistry {
    function isVerified(address user) external view returns (bool);
    function registerUser(address user, bytes32 idHash) external;
    event UserVerified(address indexed user, bytes32 indexed idHash, uint256 timestamp);
}

contract RitualGuardian {
    IERC20        public token;
    IKYCRegistry  public kyc;
    uint256       public constant TIME_LOCK = 1 days;

    mapping(address => bool)    public hasClaimed;
    mapping(address => uint256) public nextClaimTime;

    event AirdropClaimed(address indexed user, uint256 amount, uint256 timestamp);

    constructor(address _token, address _kycRegistry) {
        token = IERC20(_token);
        kyc   = IKYCRegistry(_kycRegistry);
    }

    /// @notice Only your KYC oracle should call this after verifying pic+ID.
    function registerUser(address user, bytes32 idHash) external {
        // e.g. onlyOwner or multi-sig check
        require(msg.sender == address(kyc), "Not authorized oracle");
        kyc.registerUser(user, idHash);
    }

    /// @notice Anyone verified off-chain can then claim on-chain.
    function claimRitualAirdrop(uint256 amount) external {
        require(!hasClaimed[msg.sender], "Already claimed");
        require(kyc.isVerified(msg.sender),    "KYC pending");
        require(block.timestamp >= nextClaimTime[msg.sender], "Too soon to claim");

        hasClaimed[msg.sender]    = true;
        nextClaimTime[msg.sender] = block.timestamp + TIME_LOCK;

        require(token.transfer(msg.sender, amount), "Transfer failed");
        emit AirdropClaimed(msg.sender, amount, block.timestamp);
    }
}
