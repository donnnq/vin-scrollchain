// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vinHumanitarianAidScroll
/// @notice VINVIN's vault to fund verified humanitarian efforts in crisis zones
contract vinHumanitarianAidScroll {
    address public scrollkeeper;
    mapping(address => bool) public trustedProviders;
    mapping(address => uint256) public allocatedFunds;

    event AidAllocated(address indexed to, uint256 amount);
    event ProviderVerified(address indexed provider);
    event FundsWithdrawn(address indexed provider, uint256 amount);

    modifier onlyKeeper() {
        require(msg.sender == scrollkeeper, "Not the scrollkeeper");
        _;
    }

    modifier onlyProvider() {
        require(trustedProviders[msg.sender], "Not verified for aid distribution");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function verifyProvider(address provider) external onlyKeeper {
        trustedProviders[provider] = true;
        emit ProviderVerified(provider);
    }

    function allocateFunds(address provider, uint256 amount) external onlyKeeper {
        require(trustedProviders[provider], "Must be verified to receive funds");
        require(address(this).balance >= amount, "Not enough balance in vault");
        allocatedFunds[provider] += amount;
        emit AidAllocated(provider, amount);
    }

    function withdrawFunds(uint256 amount) external onlyProvider {
        require(allocatedFunds[msg.sender] >= amount, "Exceeds approved amount");
        allocatedFunds[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit FundsWithdrawn(msg.sender, amount);
    }

    receive() external payable {}
}
