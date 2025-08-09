// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title StableBridge - Ritual scroll for cross-chain stablecoin transfers and symbolic liquidity rites
/// @author Vinvin
/// @notice Enables stablecoin bridging between Ethereum, Solana, and Layer 2s

interface IBridgeOracle {
    function lockTokens(address user, uint256 amount) external;
    function mintTokens(address user, uint256 amount) external;
}

contract StableBridge {
    address public scrollsmith;
    IBridgeOracle public oracle;

    enum Chain { Ethereum, Solana, Arbitrum, Optimism }
    mapping(address => uint256) public lockedBalance;
    mapping(address => Chain) public lastBridge;

    event TokensLocked(address indexed user, uint256 amount, Chain destination);
    event TokensMinted(address indexed user, uint256 amount, Chain origin);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor(address oracleAddress) {
        scrollsmith = msg.sender;
        oracle = IBridgeOracle(oracleAddress);
    }

    /// @notice Lock tokens on source chain before bridging
    function lockStablecoins(uint256 amount, Chain destination) external {
        lockedBalance[msg.sender] += amount;
        lastBridge[msg.sender] = destination;
        oracle.lockTokens(msg.sender, amount);
        emit TokensLocked(msg.sender, amount, destination);
    }

    /// @notice Mint equivalent tokens on destination chain
    function mintStablecoins(address user, uint256 amount, Chain origin) external onlyScrollsmith {
        oracle.mintTokens(user, amount);
        emit TokensMinted(user, amount, origin);
    }

    /// @notice View last chain bridged to
    function getLastBridge(address user) external view returns (Chain) {
        return lastBridge[user];
    }
}
