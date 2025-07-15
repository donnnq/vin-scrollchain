// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IKYCRegistry {
    function isVerified(address user) external view returns (bool);
}
interface IHumanOracle {
    function isHuman(
        address user,
        bytes32 root,
        bytes32 nullifierHash,
        bytes calldata proof
    ) external view returns (bool);
}

contract VerificationManager {
    IKYCRegistry public kyc;
    IHumanOracle public humanOracle;
    uint256      public constant MIN_TRUST_SCORE = 80;
    uint256      public constant TIME_LOCK       = 1 hours;

    mapping(address => bool)    public hasClaimed;
    mapping(bytes32 => bool)    public fingerprintUsed;
    mapping(address => uint256) public nextActionTime;
    mapping(address => uint256) public trustScore;

    constructor(address _kyc, address _humanOracle) {
        kyc         = IKYCRegistry(_kyc);
        humanOracle = IHumanOracle(_humanOracle);
    }

    /// @notice Updates trust score off‐chain via oracle
    function updateTrustScore(address user, uint256 score) external {
        require(msg.sender == address(humanOracle), "Not authorized");
        trustScore[user] = score;
    }

    /// @notice Core modifier to gate all sensitive actions
    modifier onlyVerified(
        bytes32 fingerprintHash,
        bytes32 root,
        bytes32 nullifierHash,
        bytes calldata proof
    ) {
        require(kyc.isVerified(msg.sender),             "KYC pending");
        require(humanOracle.isHuman(msg.sender, root, nullifierHash, proof),
                "Human check failed");
        require(trustScore[msg.sender] >= MIN_TRUST_SCORE,
                "Low trust score");
        require(!fingerprintUsed[fingerprintHash],      "Device used");
        require(block.timestamp >= nextActionTime[msg.sender],
                "Wait before acting again");

        // mark state
        fingerprintUsed[fingerprintHash] = true;
        nextActionTime[msg.sender]       = block.timestamp + TIME_LOCK;
        _;
    }
}
