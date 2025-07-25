// SPDX-License-Identifier: EQUALITY
pragma solidity ^0.8.25;

/// @title vin-PeopleBankProtocol.sol
/// @notice Empowers decentralized banking with AI-powered oversight and human-centric programs.
contract PeopleBankProtocol {

    address public aiCEO;
    uint256 public totalLoans;
    uint256 public seniorApplications;
    uint256 public bayanihanFunds;

    struct Loan {
        address recipient;
        uint256 amount;
        string purpose;
        bool approved;
    }

    struct SeniorPay {
        address senior;
        bool verified;
        uint256 monthlyStipend;
    }

    struct BayanihanRequest {
        address requester;
        string communityNeed;
        uint256 supportAmount;
        bool fulfilled;
    }

    mapping(uint256 => Loan) public loanRegistry;
    mapping(address => SeniorPay) public seniorSupport;
    mapping(uint256 => BayanihanRequest) public bayanihanLog;

    modifier onlyAI() {
        require(msg.sender == aiCEO, "Only the AI CEO can execute this function.");
        _;
    }

    constructor() {
        aiCEO = msg.sender;
    }

    /// @notice Senior citizens apply for monthly assistance
    function applySeniorStipend(address senior, uint256 amount) public onlyAI {
        seniorSupport[senior] = SeniorPay(senior, true, amount);
        seniorApplications++;
    }

    /// @notice Community members request loans for essentials or projects
    function requestLoan(address to, uint256 amount, string memory reason) public onlyAI {
        loanRegistry[totalLoans] = Loan(to, amount, reason, true);
        totalLoans++;
    }

    /// @notice Bayanihan fund distribution
    function dispatchBayanihan(uint256 id, address to, uint256 amount, string memory need) public onlyAI {
        bayanihanLog[id] = BayanihanRequest(to, need, amount, true);
        bayanihanFunds += amount;
    }

    /// @notice Returns total impact stats
    function systemStats() public view returns (uint256 loans, uint256 seniors, uint256 bayanihan) {
        return (totalLoans, seniorApplications, bayanihanFunds);
    }
}
