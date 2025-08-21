contract CreativeSovereigntyFund {
    address public steward = msg.sender;
    mapping(address => uint256) public creatorGrants;
    mapping(string => bool) public supportedProjects;

    event GrantIssued(address creator, uint256 amount);
    event ProjectBlessed(string title);

    function issueGrant(address creator, uint256 amount) public {
        creatorGrants[creator] += amount;
        emit GrantIssued(creator, amount);
    }

    function blessProject(string memory title) public {
        supportedProjects[title] = true;
        emit ProjectBlessed(title);
    }
}
