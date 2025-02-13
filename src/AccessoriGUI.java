import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AccessoriGUI extends JFrame {


    private JTextField queryField;
    private JButton executeButton;
    private JTextArea resultArea;

    public AccessoriGUI() {

        setTitle("Databse Accessori");
        setSize(900, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());


        queryField = new JTextField();
        add(new JLabel("Inserisci Query SQL sulla casella a sinistra:"), BorderLayout.NORTH);
        add(queryField, BorderLayout.CENTER);


        executeButton = new JButton("Esegui Query");
        add(executeButton, BorderLayout.SOUTH);


        resultArea = new JTextArea(10, 40);
        JScrollPane scrollPane = new JScrollPane(resultArea);
        add(scrollPane, BorderLayout.EAST);


        executeButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                eseguiQuery();
            }
        });
    }


    private void eseguiQuery() {
        String query = queryField.getText();
        String risultato = Accessori.eseguiQuery(query);
        resultArea.setText(risultato);
    }


    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            AccessoriGUI gui = new AccessoriGUI();
            gui.setVisible(true);
        });
    }
}
