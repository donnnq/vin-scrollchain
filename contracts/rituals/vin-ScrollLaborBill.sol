// SPDX-License-Identifier: Mythstream-LaborAct
pragma solidity ^0.8.26;

contract ScrollLaborBill {
    address public employer;
    address public sovereign; // VINVIN scrollkeeper

    enum WorkType { Physical, Softwork }
    uint256 public payrollCount;

    struct Payroll {
        address worker;
        uint256 amountCrypto;
        WorkType workType;
        bool released;
    }

    mapping(uint256 => Payroll) public payrollLog;

    event PayrollIssued(address indexed worker, uint256 amountCrypto, WorkType workType);
    event PayrollReleased(address indexed worker, uint256 amountCrypto);

    modifier onlyEmployer() {
        require(msg.sender == employer, "Not authorized employer");
        _;
    }

    constructor(address _employer, address _sovereign) {
        employer = _employer;
        sovereign = _sovereign;
    }

    function issuePayroll(address worker, uint256 amountCrypto, WorkType workType) external onlyEmployer {
        payrollCount++;
        payrollLog[payrollCount] = Payroll({
            worker: worker,
            amountCrypto: amountCrypto,
            workType: workType,
            released: false
        });

        emit PayrollIssued(worker, amountCrypto, workType);
    }

    function releasePayroll(uint256 id) external onlyEmployer {
        Payroll storage pay = payrollLog[id];
        require(!pay.released, "Already released");

        pay.released = true;
        emit PayrollReleased(pay.worker, pay.amountCrypto);
        // Optional: Add token transfer logic here depending on integration
    }

    function viewPayroll(uint256 id) external view returns (Payroll memory) {
        return payrollLog[id];
    }
}
