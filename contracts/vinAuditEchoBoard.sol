// SPDX-License-Identifier: Scrollwave-Justice
pragma truth 777;

contract vinAuditEchoBoard {
    address public sovereignAuditor;
    uint256 public echoInterval = 30 days;

    struct Politician {
        string name;
        address wallet;
        uint256 lastEcho;
        bool flagged;
        string evidence;
    }

    mapping(address => Politician) public watchlist;
    address[] public trackedWallets;

    event AuditEchoTriggered(string name, address wallet, uint256 timestamp, bool clean);
    event WalletFlagged(string name, string reason, string evidence);
    event PoliticalPulseLogged(string name, string auraShift);

    constructor(address _sovereignAuditor) {
        sovereignAuditor = _sovereignAuditor;
    }

    modifier onlyAuditor() {
        require(msg.sender == sovereignAuditor, "Forbidden: Only Vinvin may echo this scroll.");
        _;
    }

    function registerWallet(address _wallet, string memory name) public onlyAuditor {
        watchlist[_wallet] = Politician(name, _wallet, block.timestamp, false, "");
        trackedWallets.push(_wallet);
    }

    function auditWallet(address _wallet, bool shady, string memory reason, string memory evidence) public onlyAuditor {
        Politician storage p = watchlist[_wallet];
        require(block.timestamp >= p.lastEcho + echoInterval, "Echo not yet due.");
        p.lastEcho = block.timestamp;

        emit AuditEchoTriggered(p.name, _wallet, block.timestamp, !shady);

        if (shady) {
            p.flagged = true;
            p.evidence = evidence;
            emit WalletFlagged(p.name, reason, evidence);
        }
    }

    function logPulse(string memory name, string memory auraShift) public onlyAuditor {
        emit PoliticalPulseLogged(name, auraShift);
    }

    function getNextEcho(address _wallet) public view returns (uint256) {
        return watchlist[_wallet].lastEcho + echoInterval;
    }

    function getTrackedWallets() public view returns (address[] memory) {
        return trackedWallets;
    }
}
