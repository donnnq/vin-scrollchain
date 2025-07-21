// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title FelixFixIt
/// @notice On-chain “Felix” role: report issues, invoke fixes, rescue stuck funds
contract FelixFixIt {
    // —— Events ——
    event IssueReported(uint256 indexed id, address indexed reporter, string desc, uint256 timestamp);
    event IssueFixed(uint256 indexed id, address indexed fixer, string fixDesc, uint256 timestamp);
    event TokensRescued(address indexed token, address indexed to, uint256 amount);
    event ETHRescued(address indexed to, uint256 amount);
    event FelixChanged(address indexed oldFelix, address indexed newFelix);

    // —— State ——
    address public felix;
    uint256 public issueCount;

    enum IssueStatus { Open, Fixed }
    struct Issue {
        address reporter;
        string description;
        IssueStatus status;
        uint256 openedAt;
        uint256 fixedAt;
        string fixDescription;
    }
    mapping(uint256 => Issue) public issues;

    // —— Modifiers ——
    modifier onlyFelix() {
        require(msg.sender == felix, "FFI: caller is not Felix");
        _;
    }

    // —— Constructor ——
    constructor(address _felix) {
        require(_felix != address(0), "FFI: zero Felix");
        felix = _felix;
    }

    // —— Issue Reporting & Fixing ——

    /// @notice Anyone can report an on-chain issue.
    function reportIssue(string calldata desc) external returns (uint256) {
        issueCount += 1;
        issues[issueCount] = Issue({
            reporter: msg.sender,
            description: desc,
            status: IssueStatus.Open,
            openedAt: block.timestamp,
            fixedAt: 0,
            fixDescription: ""
        });
        emit IssueReported(issueCount, msg.sender, desc, block.timestamp);
        return issueCount;
    }

    /// @notice Felix fixes a reported issue.
    function fixIssue(uint256 id, string calldata fixDesc) external onlyFelix {
        Issue storage iss = issues[id];
        require(iss.status == IssueStatus.Open, "FFI: not open");
        iss.status = IssueStatus.Fixed;
        iss.fixedAt = block.timestamp;
        iss.fixDescription = fixDesc;
        emit IssueFixed(id, msg.sender, fixDesc, block.timestamp);
    }

    // —— Emergency Rescue ——

    /// @notice Rescue ERC-20 tokens stuck in this contract.
    function rescueTokens(address token, address to, uint256 amount) external onlyFelix {
        require(to != address(0), "FFI: zero recipient");
        require(amount > 0, "FFI: zero amount");
        bool ok = IERC20(token).transfer(to, amount);
        require(ok, "FFI: transfer failed");
        emit TokensRescued(token, to, amount);
    }

    /// @notice Rescue ETH stuck in this contract.
    function rescueETH(address payable to, uint256 amount) external onlyFelix {
        require(to != address(0), "FFI: zero recipient");
        require(address(this).balance >= amount, "FFI: insufficient ETH");
        to.transfer(amount);
        emit ETHRescued(to, amount);
    }

    // —— Felix Management ——

    /// @notice Change the Felix “fixer” address.
    function changeFelix(address newFelix) external onlyFelix {
        require(newFelix != address(0), "FFI: zero address");
        emit FelixChanged(felix, newFelix);
        felix = newFelix;
    }

    // —— Fallbacks ——
    receive() external payable {}
}

/// @dev Minimal ERC-20 interface
interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);
}
